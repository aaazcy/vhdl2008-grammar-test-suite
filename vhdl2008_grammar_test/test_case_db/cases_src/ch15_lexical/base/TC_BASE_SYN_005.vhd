-- =============================================================
-- Case ID: TC_BASE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: base ::= integer
-- Case Type: Positive
-- Test Focus: base used in signal default value expressions and variable initialization with based_literal(4#33#, 9#88#): verify the correct syntax of base combined with based_integer in the two contexts of in-process variable declaration and architecture signal declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bs_signal_variable_ctx is
  port (
    sig_val : out integer;
    var_val : out integer
  );
end entity bs_signal_variable_ctx;

architecture rtl of bs_signal_variable_ctx is
  signal s_base4 : integer := 4#33#;
begin
  process(s_base4)
    variable v_base9 : integer := 9#88#;
  begin
    v_base9 := s_base4 + v_base9;
    sig_val <= s_base4;
    var_val <= v_base9;
  end process;
end architecture rtl;
