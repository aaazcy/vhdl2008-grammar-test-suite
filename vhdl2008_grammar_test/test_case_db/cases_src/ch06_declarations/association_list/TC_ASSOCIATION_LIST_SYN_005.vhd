-- =============================================================
-- Case ID: TC_ASSOCIATION_LIST_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSOCIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_list ::= association_element { , association_element }
-- Case Type: Positive
-- Test Focus: Exercises association_list syntax variant 5 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity association_list_syn5 is
  port (
    a : in  bit_vector(2 downto 0);
    b : in  bit_vector(2 downto 0);
    y : out bit_vector(3 downto 0)
  );
end entity association_list_syn5;

architecture rtl of association_list_syn5 is
  component adder is
    port (
      op_a : in  bit_vector(2 downto 0);
      op_b : in  bit_vector(2 downto 0);
      cin  : in  bit;
      sum  : out bit_vector(2 downto 0);
      cout : out bit
    );
  end component;
  signal s_sum  : bit_vector(2 downto 0);
  signal s_cout : bit;
begin
  u_add : adder
    port map (
      op_a => a,
      op_b => b,
      cin  => '0',
      sum  => s_sum,
      cout => s_cout
    );
  y <= s_cout & s_sum;
end architecture rtl;
