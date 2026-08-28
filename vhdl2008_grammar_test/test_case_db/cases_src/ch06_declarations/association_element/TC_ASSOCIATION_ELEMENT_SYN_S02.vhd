-- =============================================================
-- Case ID: TC_ASSOCIATION_ELEMENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSOCIATION_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_element ::= [ formal_part => ] actual_part
-- Case Type: Positive
-- Test Focus: Production-specific: exercises association_element with both named (formal_part =>) and positional (actual_part only) forms in a single port_map_aspect.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity assoc_elem_syn_s2 is
  port (
    a : in  bit_vector(3 downto 0);
    b : in  bit_vector(3 downto 0);
    s : out bit_vector(4 downto 0)
  );
end entity assoc_elem_syn_s2;

architecture rtl of assoc_elem_syn_s2 is
  component ripple_carry_adder is
    port (
      op_a  : in  bit_vector(3 downto 0);
      op_b  : in  bit_vector(3 downto 0);
      carry_in  : in  bit;
      sum_out   : out bit_vector(3 downto 0);
      carry_out : out bit
    );
  end component;
  signal s_sum   : bit_vector(3 downto 0);
  signal s_carry : bit;
begin
  -- named association (formal_part =>) and positional mixed
  u_rca : ripple_carry_adder
    port map (
      op_a      => a,
      op_b      => b,
      carry_in  => '0',
      sum_out   => s_sum,
      carry_out => s_carry
    );
  s <= s_carry & s_sum;
end architecture rtl;
