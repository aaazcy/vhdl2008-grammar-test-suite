-- =============================================================
-- Case ID: TC_ASSOCIATION_LIST_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSOCIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_list ::= association_element
--              { , association_element }
-- Case Type: Positive (Production-Specific)
-- Test Focus: association_list — exercises a comma-separated list of
--             association_elements in a component instantiation port
--             map with both named and positional associations mixed.
--             Demonstrates the { , association_element } repetition.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity association_list_syn1 is
  port (
    clk     : in  bit;
    a_in    : in  bit_vector(7 downto 0);
    b_in    : in  bit_vector(7 downto 0);
    sum_out : out bit_vector(8 downto 0)
  );
end entity association_list_syn1;

architecture arch of association_list_syn1 is

  component full_adder_8bit is
    port (
      clock  : in  bit;
      a      : in  bit_vector(7 downto 0);
      b      : in  bit_vector(7 downto 0);
      cin    : in  bit;
      sum    : out bit_vector(7 downto 0);
      cout   : out bit
    );
  end component;

  signal s_cin     : bit := '0';
  signal s_sum_reg : bit_vector(7 downto 0);
  signal s_cout    : bit;

begin

  -- association_list with 6 comma-separated association_elements
  -- Elements 1-5 use named form, element 6 uses positional form
  -- The list demonstrates: elem1, elem2, elem3, elem4, elem5, elem6
  u_adder : component full_adder_8bit
    port map (
      clock  => clk,
      a      => a_in,
      b      => b_in,
      cin    => s_cin,
      sum    => s_sum_reg,
      cout   => s_cout
    );

  sum_out <= s_cout & s_sum_reg;

end architecture arch;
