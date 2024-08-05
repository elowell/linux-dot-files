"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = __importStar(require("vscode"));
const dbt_formatter_1 = __importDefault(require("dbt-formatter"));
const getDocumentRange = (document) => {
    const lastLineId = document.lineCount - 1;
    return new vscode.Range(0, 0, lastLineId, document.lineAt(lastLineId).text.length);
};
const newLineConfig = (options) => {
    if (options.insertFinalNewline === undefined) {
        if (options.trimFinalNewlines === undefined) {
            return true;
        }
        return !options.trimFinalNewlines;
    }
    return options.insertFinalNewline === true;
};
const getConfig = (options) => ({
    lowerWords: vscode.workspace
        .getConfiguration("dbt-formatter")
        .get("lowerWords", true),
    upper: vscode.workspace.getConfiguration("dbt-formatter").get("upper", true),
    allowCamelcase: vscode.workspace
        .getConfiguration("dbt-formatter")
        .get("camelCase", true),
    sql: vscode.workspace
        .getConfiguration("dbt-formatter")
        .get("dialect", "default"),
    indent: options.tabSize,
    newline: newLineConfig(options),
});
function activate(context) {
    const disposable = vscode.languages.registerDocumentFormattingEditProvider([{ language: "sql" }, { language: "jinja-sql" }], { provideDocumentFormattingEdits });
    context.subscriptions.push(disposable);
}
exports.activate = activate;
function provideDocumentFormattingEdits(document, options, token) {
    return __awaiter(this, void 0, void 0, function* () {
        const edits = [];
        if (document.lineCount >= 1) {
            let firstLine = document.lineAt(0);
            // check for ignore text
            if (firstLine.text.indexOf("dbt-formatter-ignore") === -1) {
                const text = document.getText();
                const formatted = dbt_formatter_1.default(text, getConfig(options));
                if (formatted && formatted.length > 0) {
                    const replacement = vscode.TextEdit.replace(getDocumentRange(document), formatted);
                    edits.push(replacement);
                }
            }
        }
        return edits;
    });
}
exports.provideDocumentFormattingEdits = provideDocumentFormattingEdits;
// this method is called when your extension is deactivated
function deactivate() { }
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map