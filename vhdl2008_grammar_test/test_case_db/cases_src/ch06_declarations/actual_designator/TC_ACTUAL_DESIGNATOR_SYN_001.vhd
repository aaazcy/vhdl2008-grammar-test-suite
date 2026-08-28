-- =============================================================
-- Case ID: TC_ACTUAL_DESIGNATOR_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_designator ::= [ inertial ] expression | signal_name
--              | variable_name | file_name | subtype_indication
--              | subprogram_name | instantiated_package_name | open
-- Case Type: Positive (Production-Specific)
-- Test Focus: actual_designator in port map context — exercises
--             expression, signal_name, and open alternatives
--             within a component instantiation of an adder.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity actual_designator_syn1 is
  port (
    a_in    : in  bit_vector(3 downto 0);
    b_in    : in  bit_vector(3 downto 0);
    sum_out : out bit_vector(4 downto 0)
  );
end entity actual_designator_syn1;

architecture arch of actual_designator_syn1 is

  component ripple_adder is
    port (
      a    : in  bit_vector(3 downto 0);
      b    : in  bit_vector(3 downto 0);
      cin  : in  bit;
      sum  : out bit_vector(3 downto 0);
      cout : out bit
    );
  end component;

  signal s_carry_in  : bit := '0';
  signal s_carry_out : bit;
  signal s_sum_lo    : bit_vector(3 downto 0);
  signal s_a_reg      : bit_vector(3 downto 0) := "0000";
  signal s_b_reg      : bit_vector(3 downto 0) := "0000";

begin

  -- actual_designator = expression: (s_a_reg and s_b_reg) is a bit_vector expression
  -- actual_designator = signal_name: s_carry_in is a signal name
  -- actual_designator = open: the cout port is left unconnected
  u_adder : component ripple_adder
    port map (
      a    => s_a_reg and s_b_reg,
      b    => b_in,
      cin  => s_carry_in,
      sum  => s_sum_lo,
      cout => open
    );

  -- Use all declared signals
  s_a_reg <= a_in;
  s_b_reg <= b_in;
  sum_out <= s_carry_out & s_sum_lo;
  s_carry_out <= '0' when s_sum_lo = "0000" else '1';

end architecture arch;
