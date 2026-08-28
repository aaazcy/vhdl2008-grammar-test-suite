-- =============================================================
-- Case ID: TC_CONDITION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONDITION_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Rule Description: Condition expression must evaluate to type boolean
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: condition expression comparing integer with bit_vector
-- Expected Result: Triggers semantic error: type mismatch in condition
-- Dependencies: None
-- =============================================================
entity condition_sem1_ent is port(a:in integer; b:in bit_vector(7 downto 0); y:out integer); end entity;
architecture bh of condition_sem1_ent is
begin process(a,b) begin if a=b then y<=1; else y<=0; end if; end process; end architecture bh;
