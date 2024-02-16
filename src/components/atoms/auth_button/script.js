class AstroGreet extends HTMLElement {
    constructor() {
        
        super();

        // Read the message from the data attribute.
        const label = this.dataset.message;
        const button = this.querySelector("button");
        if (button && label == "PreRegister") {
            button.addEventListener("click", () => {
                console.log(label);

            });
        }
    }
}

customElements.define("astro-greet", AstroGreet);