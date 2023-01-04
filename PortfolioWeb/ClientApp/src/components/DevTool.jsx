import React, { useState, useEffect } from 'react';
import { GetDevTools } from './utility';

export function DevTool(props) {
    const [devtools, setDevtools] = useState([]);
    const tooltype = props.toolType;
    const subsectioncode = props.devSubsectionCode

    useEffect(() => {

        (
            async () => {
                const devtoolsobj = await GetDevTools(subsectioncode);
                setDevtools(devtoolsobj);
            }
        )();
    }, [subsectioncode]);
    if (devtools.length == 0) {
        return;
    }
    let tools = devtools;
    if (tooltype != "") {
        tools = (devtools.filter(t => t.devToolTypeCode == tooltype))
    }
    const skills = tools.filter(t => t.devToolTypeCode == "skill")
    let firstli;
    if (skills.length > 0) {
        firstli = "~";
    }
    return (
        <ul className="text-center">
            <li style={{ listStyleType: 'none', display: 'inline-block' }}>{firstli}{<span>&nbsp;</span>}</li>
            {tools.map((t, index) => <li key={index} style={{ listStyleType: 'none', display: 'inline-block' }}>{GetTool(t)}</li>)}
        </ul>
    )
}

function GetTool(t) {
    const imgpath = "/tool/" + t.devToolCode + ".png";
    if (t.hasIcon) {
        return (
            <figure className="figure mx-2">
                <figcaption className="figure-caption m-0 text-center" style={{ fontWeight: 'bold' }}>{t.devToolName}</figcaption>
                <img src={imgpath} className="figure-img img-fluid rouded m-0" style={{ objectFit: 'contain', width: "70px", height: "65px" }} />

            </figure>)
    }
    else {
        return <span>{t.devToolName} ~{<span>&nbsp;</span>}</span>
    }
}