import React from 'react';
import { Navbar, NavItem, NavLink } from 'reactstrap';
import { Link } from 'react-router-dom';

export function DevSubsectionNav(props) {
    const subsections = props.subsections;
    return (
        <Navbar>
            <ul className="navbar-nav">
                {subsections.map(s =>

                    <NavItem key={s.devSubsectionCode}>
                        <NavLink tag={Link} className="text-dark" to={"/DevSection/" + s.devSectionCode + "/" + s.devSubsectionCode}>{s.devSubsectionName}</NavLink>
                    </NavItem>
                )}
            </ul>
        </Navbar>
    )
}