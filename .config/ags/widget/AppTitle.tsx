import AstalHyprland from "gi://AstalHyprland"
import { bind } from "../../../../../../usr/share/astal/gjs"

export default function AppTitle() {
    const hypr = AstalHyprland.get_default();
    const focused = bind(hypr, "focusedClient");

    return <box
        className="Focused"
        visible={focused.as(Boolean)}
    >
    {/**        {focused.as(client => (
            client && <label label={bind(client, "title").get()} />
        ))}*/}
        <label label={"Some label"} />
    </box>
}
