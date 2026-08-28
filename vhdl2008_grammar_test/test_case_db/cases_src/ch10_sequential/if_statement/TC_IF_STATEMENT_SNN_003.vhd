-- =============================================================
-- Case ID: TC_IF_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: elsif missing "then" — `elsif a>10 y<=10;`, after the elsif condition the then keyword is missing and an assignment follows directly, verifies the elsif branch equally requires the then keyword
-- Expected Result: Triggers syntax error: missing then after elsif condition
-- Dependencies: None
-- =============================================================
entity if_snn3_ent is port(a:in integer; y:out integer); end entity;
architecture bh of if_snn3_ent is
begin process(a) begin if a>0 then y<=a; elsif a>10 y<=10; else y<=0; end if; end process; end architecture bh;
