-- =============================================================
-- Case ID: TC_VARIABLE_ASSIGNMENT_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: variable_assignment_statement ::= [ label : ] target := expression ;
-- Case Type: Negative
-- Test Focus: SNN: Using `<=` instead of `:=` — `v_val<=42;` uses the signal assignment arrow on a variable, verifying that variable_assignment requires the `:=` operator
-- Expected Result: Triggers syntax error: wrong assignment operator for variable
-- Dependencies: None
-- =============================================================
entity vas_snn2_ent is port(a:in integer; y:out integer); end entity;
architecture bh of vas_snn2_ent is signal s_res:integer:=0;
begin process(a) variable v:integer; begin v<=a; s_res<=v; end process; y<=s_res; end architecture bh;
