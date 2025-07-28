// By: Mohammad Kadkhodaei
// Date: 1404-05-05
// Find Bug in L3Sentry Code

// TT_FLUSH_PGM_TO_L3
// ExecuteSQL(nil, GET_UNDONE_TASKS, [prod_line, maxActv]);

// Have bug, need to consider & add second parameter
GET_UNDONE_TASKS    = 'select *                     ' +
                      'from (                       ' +
                      'SELECT TASK_COUNTER,         ' +
                      '       PO_ID, HEAT_ID        ' +
                      'FROM   PGM_TASKS             ' +
                      'WHERE  TASK_STATUS = 0       ' +
                      'and    prev_task_status = 0  ' +
                      'AND    LINE_ID = %d          ' +
                      'order by 1 desc              ' +
                      ') where rownum <=30          ';
					  
{
Parameter Mismatch:
The query has one parameter placeholder (%d for LINE_ID)
But two parameters are passed in the array [prod_line, maxActv]
The second parameter (maxActv) isn't used in the query
}