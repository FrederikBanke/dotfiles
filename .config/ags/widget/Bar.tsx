import { Variable } from "astal";
import { App, Astal, type Gdk, Gtk } from "astal/gtk3";
import AppTitle from "./AppTitle";

const time = Variable("").poll(1000, "date");

export default function Bar(gdkmonitor: Gdk.Monitor) {
    return (
        <window
            className="Bar"
            gdkmonitor={gdkmonitor}
            exclusivity={Astal.Exclusivity.EXCLUSIVE}
            anchor={
                Astal.WindowAnchor.TOP |
                Astal.WindowAnchor.LEFT |
                Astal.WindowAnchor.RIGHT
            }
            application={App}
        >
            <centerbox>
                <AppTitle />
                <button
                    type="submit"
                    onClicked="echo helloaa"
                    halign={Gtk.Align.CENTER}
                >
                    Welcome to AGS?
                </button>
                <box />
                <button
                    onClick={() => print("hello")}
                    halign={Gtk.Align.CENTER}
                >
                    <label label={time()} />
                </button>
            </centerbox>
        </window>
    );
}
