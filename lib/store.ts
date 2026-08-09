export type Trade={id:string;date:string;symbol:string;side:string;pnl:number;result:"win"|"loss";risk:number;rr:number;setup:string;notes:string};
const key="liveones_trades";
export function getTrades():Trade[]{if(typeof window==="undefined")return[];try{return JSON.parse(localStorage.getItem(key)||"[]")}catch{return[]}}
export function saveTrade(t:Trade){const all=getTrades();localStorage.setItem(key,JSON.stringify([t,...all]))}
export function deleteTrade(id:string){localStorage.setItem(key,JSON.stringify(getTrades().filter(x=>x.id!==id)))}
export function clearTrades(){localStorage.removeItem(key)}