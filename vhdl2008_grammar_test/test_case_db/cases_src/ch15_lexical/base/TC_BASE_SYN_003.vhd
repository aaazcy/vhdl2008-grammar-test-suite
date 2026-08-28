-- =============================================================
-- Case ID: TC_BASE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: base ::= integer
-- Case Type: Positive
-- Test Focus: base using non-power-of-two radices 3 (ternary base) and 5 (quinary base) in based_literal(3#22#, 5#44#) verify the legal syntax of non-traditional radices in the base position
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bs_non_power_of_two is
  port (
    ter_val : out integer;
    qui_val : out integer
  );
end entity bs_non_power_of_two;

architecture rtl of bs_non_power_of_two is
  constant C_TER : integer := 3#22#;
  constant C_QUI : integer := 5#44#;
begin
  ter_val <= C_TER;
  qui_val <= C_QUI;
end architecture rtl;
