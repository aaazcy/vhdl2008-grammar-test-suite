-- =============================================================
-- Case ID: TC_IF_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "end if" — the if-then-else chain ends with process directly after the last else body, end if is missing, verifies the if construct must be explicitly closed with end if
-- Expected Result: Triggers syntax error: missing end if
-- Dependencies: None
-- =============================================================
entity if_snn2_ent is port(a:in integer; y:out integer); end entity;
architecture bh of if_snn2_ent is
begin process(a) begin if a>0 then y<=a; else y<=0; end process; end architecture bh;
