import React, { useState, useEffect } from 'react';
import { GetDevSections, GetProfile, GetDevToolTypes } from './utility';
import { DevTool } from './DevTool'

function Home() {
    const [profile, setProfile] = useState({});
    const [devsections, setDevsections] = useState([]);
    const [tooltypes, setToolTypes] = useState([]);

    useEffect(() => {

        (
            async () => {
                const profileobj = await GetProfile();
                setProfile(profileobj);

                const devsectionobj = await GetDevSections();
                setDevsections(devsectionobj);

                const tooltypesobj = await GetDevToolTypes();
                setToolTypes(tooltypesobj);

            }
        )();
    }, [])
    if (profile.profileDesc == null || devsections.length == 0 || tooltypes.length == 0) {
        return <p>Loading...</p>
    }
    const tooltypesforhome = tooltypes.filter(t => t.showOnHomePage == true);
    return (
        <div className="container">
            <div>
                <div className="row">
                    <div className="col-md-12 bg-light mb-5 p-3 h5" style={{ borderStyle: 'dotted' }}>
                        <p >{profile.profileDesc}</p>
                    </div>
                </div>

                {tooltypesforhome.map(t =>
                    <div className="row my-2" key={t.devToolTypeCode}>
                        <div className="col-md-12 d-flex justify-content-center">
                            <DevTool toolType={t.devToolTypeCode} devSubsectionCode="" />
                        </div>
                    </div>)
                }

                <div className="row row-cols-1 row-cols-md-4 g-4">
                    {devsections.map(d =>
                        <div className="col"/*col-md-3 d-flex align-items-stretch mb-2"*/ key={d.devSectionCode}>

                            <div className="card h-100">
                                <div className="card-header">{d.devSectionName}</div>
                                <div className="card-body">{d.devSectionBlurb}</div>
                            </div>
                        </div>)}
                </div>
            </div>
        </div>
    );
}

export default Home;
