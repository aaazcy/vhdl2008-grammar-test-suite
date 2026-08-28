-- =============================================================
-- Case ID: TC_IF_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "then" — `if en='1' y<=a; end if;`, an assignment statement appears directly after the condition, the "then" keyword is missing, verifies the then keyword of if is a mandatory delimiter
-- Expected Result: Triggers syntax error: missing "then" after condition
-- Dependencies: None
-- =============================================================
entity if_snn1_ent is port(en:in bit; a:in integer; y:out integer); end entity;
architecture bh of if_snn1_ent is
begin process(en,a) begin if en='1' y<=a; end if; end process; end architecture bh;
