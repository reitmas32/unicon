import { useState } from 'react';
import UButtonAppBar from './atoms/UButtonAppBar';
import './UAppBar.css';
import UDrawer from './molecules/UDrawer';
import GitHubButton from './atoms/GitHubButton';
import InstagramButton from './atoms/InstagramButton';
import { useNavigate } from 'react-router-dom';

class NavButton {
    label: string;
    path: string;
    constructor(label: string, path: string) {
        this.label = label;
        this.path = path;
    }
}


export default function UAppBar() {
    const [activeButton, setActiveButton] = useState<string>('Inicio');
    const [drawerOpen, setDrawerOpen] = useState<boolean>(false);

    const navButtons: NavButton[] = [
        new NavButton('Inicio', '/'),
        new NavButton('FAQ', '/faq'),
    ];

    const handleButtonClick = (navButtonData: NavButton) => {
        setActiveButton(navButtonData.label);
        handleNavigate(navButtonData.path);
    };

    const handleHamburgerClick = () => {
        setDrawerOpen(true);
    };

    const handleCloseDrawer = () => {
        setDrawerOpen(false);
    };

    const navigate = useNavigate();

    const handleNavigate = (path: string) => {
        navigate(path);
    };

    return (
        <div className="appBar">
            <div className="logoContainer">
                <img src="/favicon.png" alt="logo" className="logo" />
            </div>
            <div className="buttonsContainer">
                {navButtons.map((element) => (
                    <UButtonAppBar
                        key={element.label}
                        label={element.label}
                        isActive={activeButton === element.label}
                        onClick={() => handleButtonClick(element)}
                    />
                ))}
                <GitHubButton />
                <InstagramButton />
            </div>
            <div className="hamburger" onClick={handleHamburgerClick}>
                { }
                &#9776; { }
            </div>

            <UDrawer
                open={drawerOpen}
                onClose={handleCloseDrawer}
                onButtonClick={() => handleButtonClick(navButtons[0])}
            />
        </div>
    );
}
