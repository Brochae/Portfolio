import React, { useState, useEffect } from 'react';
import { Navbar, NavItem, NavLink, TabPane, TabContent } from 'reactstrap';
import { Link } from 'react-router-dom';
import { GetDevSubsectionElements, GetDevTools } from './utility';
import { SQLScript } from './SQLScript'
import { DevTool } from './DevTool';


export function DevSubsection(props) {
    const subsection = props.subsection;
    const [activetab, setActiveTab] = useState(1);
    const [elements, setElements] = useState([]);

    useEffect(() => {

        (
            async () => {
                const elementsobj = await GetDevSubsectionElements();
                setElements(elementsobj);
            }
        )();
    }, []);
    if (elements.length == 0) { return <p>Loading...</p> }

    const code = subsection.devSubsectionCode;
    const subelements = elements.filter(e => e.devSubsectionCode == code)
    return (
        <div>
            <div className="row">
                <div className="col-md-2">
                    <h5>{subsection.devSubsectionName}</h5>
                </div>
                <div className="col-md-10">
                    {
                        subsection.gitHubRepoName ?
                            <div><a href={subsection.gitHubRepoName} target="_blank" className="btn btn-info">Github Repo</a></div>
                            :
                            null
                    }
                    
                </div>
                
                </div>
            <div className="row">
                <div>{subsection.devSubsectionDesc}</div>
            </div>
            <div className="row">
                <div className="col-md-12">
                    <hr/>
                    <DevTool toolType="language" devSubsectionCode={code} />
                    <DevTool toolType="skill" devSubsectionCode={code} />
                    <hr/>
                </div>
            </div>
            <div className="row">
                <Navbar className="navbar-expand-sm">
                    <ul className="navbar-nav">
                        {subelements.map(e =>
                            <NavItem key={e.devSubsectionElementCode} tag={Link} to="" className="btn btn-primary mx-2" onClick={() => setActiveTab(e.devSubsectionElementSequence)}>
                                {e.buttonText}
                            </NavItem>)}
                    </ul>
                </Navbar>
            </div>
            <div className="row">
                <TabContent activeTab={activetab} >
                    {
                        subelements.map(e =>
                            <TabPane key={e.devSubsectionElementCode} tabId={e.devSubsectionElementSequence}>
                                {GetSubElement(e)}
                            </TabPane>
                        )
                    }
                </TabContent>
            </div>
        </div>

    )
}

function GetSubElement(e) {
    const fileurl = "/" + e.devSubsectionElementCode + "/" + e.devSubsectionCode + e.fileExtension;
    switch (e.htmlTag) {
        case "img":
            return <img src={fileurl} />
            break;
        case "iframe":
            return <SQLScript dirpath={fileurl} />
            break;
    }
}