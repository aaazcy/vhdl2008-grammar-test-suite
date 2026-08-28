-- =============================================================
-- Case ID: TC_SEM_VAS_001_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_VAS_001
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Rule Description: Variable assignment expression type must be compatible with the variable type — type mismatch triggers type_mismatch
-- Case Type: Negative
-- Error Category: type_mismatch
-- Test Focus: Counterexample: variable v_val is integer, but the expression assigns a bit_vector literal `X"FF"`, verifying the analyzer detects incompatible types on the left and right sides of :=
-- Expected Result: Triggers semantic error: type mismatch in variable assignment
-- Dependencies: None
-- =============================================================
entity vas_smn_ent is port(a:in integer; y:out integer); end entity;
architecture bh of vas_smn_ent is signal s_res:integer:=0;
begin process(a) variable v_val:integer:=0; begin v_val:=X"FF"; s_res<=a; end process; y<=s_res; end architecture bh;
