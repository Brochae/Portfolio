import React, { useState, useEffect } from 'react';
import { GetSQLScript } from './utility';

export function SQLScript(props) {
    const [filecontents, setFilecontents] = useState("");
    const fileurl = props.dirpath;

    useEffect(() => {

        (
            async () => {
                const filecontentsval = await GetSQLScript(fileurl);
                setFilecontents(filecontentsval);
            }
        )();
    }, [fileurl]);
    if (filecontents == "") return <p>Loading...</p>;
    return (
        <div className="code" dangerouslySetInnerHTML={{ __html: filecontents }}>
        </div>
        )
}