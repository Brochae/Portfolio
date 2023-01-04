import React, { Component } from 'react';
import { Collapse, Navbar, NavbarBrand, NavbarToggler, NavItem, NavLink } from 'reactstrap';
import { Link } from 'react-router-dom';
import './NavMenu.css';
import { GetProfile, GetDevSections } from './utility';

export class NavMenu extends Component {
    static displayName = NavMenu.name;

    constructor(props) {
        super(props);

        this.toggleNavbar = this.toggleNavbar.bind(this);
        this.state = {
            collapsed: true,
            profile: {},
            devsections: []
        };
    }

    async componentDidMount() {
        const profileobj = await GetProfile();
        const devsectionobj = await GetDevSections();
        this.setState({ profile: profileobj, devsections: devsectionobj })
    }
    toggleNavbar() {
        this.setState({
            collapsed: !this.state.collapsed
        });
    }

    render() {
        const profile = this.state.profile;
        const devsections = this.state.devsections;
        return (

            <header>
                <Navbar className="navbar-expand-sm navbar-toggleable-sm ng-white border-bottom box-shadow mb-3 container-fluid light">
                    
                    <NavbarBrand tag={Link} to="/">
                            <img src="/1.jpg" width="70px" className="rounded-pill p-1" />
                            {profile.firstName + " " + profile.lastName + "'s Software Portfolio"}
                        
                    </NavbarBrand>
                    <NavbarToggler onClick={this.toggleNavbar} className="mr-2" />
                    <Collapse className="justify-content-between" isOpen={!this.state.collapsed} navbar>
                        <ul className="navbar-nav">
                            {devsections.map(d =>

                                <NavItem key={d.devSectionCode}>
                                    <NavLink tag={Link} className="text-dark" to={"/DevSection/" + d.devSectionCode}>{d.devSectionName }</NavLink>
                                </NavItem>
                            )}
                        </ul>
                        <ul className="navbar-nav flex-grow">
                            <li>
                                <a className="nav-link" target="_blank" href={profile.gitHubAccount}>GitHub</a>
                            </li>
                            <li>
                                <a className="nav-link" target="_blank" href="Brocha_Eckstein_Software_Development_Resume.pdf">Get My Resume</a>
                            </li>

                        </ul>
                    </Collapse>
                </Navbar>
            </header>
        );
    }
}
