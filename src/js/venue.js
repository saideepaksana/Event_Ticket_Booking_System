import db from './db.js'

const venue_name= async (t)=>{
    const rows=await db.connection.query('SELECT VENUE_NAME from VENUE where VENUE_ID=?',[t]);
    return rows[0].VENUE_NAME;
}
export default {venue_name}