-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_NUMERIC_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: numeric_literal ::= abstract_literal | physical_literal
-- Case Type: Positive
-- Test Focus: mixed numeric_literal types: abstract_literal (integer, real, based) and physical_literal (time units) used together in the same design, verifying that the compiler correctly distinguishes and accepts the two forms
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity num_lit_mixed is
  port (
    mode_sel : in  integer range 0 to 2;
    data_out : out integer
  );
end entity num_lit_mixed;

architecture mixed_literals of num_lit_mixed is
  constant C_ABS_INT : integer := 100;        -- abstract_literal: integer
  constant C_ABS_REAL : real := 3.14;          -- abstract_literal: real
  constant C_ABS_BASED : integer := 16#FFFF#;  -- abstract_literal: based
  constant C_PHYS : time := 10 ns;             -- physical_literal

  signal s_delay_count : integer := 0;
begin
  process
  begin
    wait for C_PHYS;  -- physical_literal used
    s_delay_count <= s_delay_count + 1;
  end process;

  with mode_sel select
    data_out <= C_ABS_INT                          when 0,
                integer(C_ABS_REAL * 10.0)         when 1,
                C_ABS_BASED mod 256                when 2;
end architecture mixed_literals;
