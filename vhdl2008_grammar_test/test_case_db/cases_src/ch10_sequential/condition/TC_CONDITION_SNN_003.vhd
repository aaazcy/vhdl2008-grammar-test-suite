-- =============================================================
-- Case ID: TC_CONDITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: condition ::= expression
-- Case Type: Negative
-- Test Focus: SNN: non-boolean expression used as condition — bit_vector used where boolean expected in if statement
-- Expected Result: Triggers type error: condition must be boolean
-- Dependencies: None
-- =============================================================
entity condition_snn3_ent is port(bv:in bit_vector(3 downto 0); y:out integer); end entity;
architecture bh of condition_snn3_ent is
begin process(bv) begin if bv then y<=1; end if; end process; end architecture bh;
