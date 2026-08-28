-- =============================================================
-- Case ID: TC_PORT_MAP_ASPECT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: port_map_aspect ::= port map ( port_association_list )
-- Case Type: Positive
-- Test Focus: Exercises port_map_aspect with named association, positional association, and open associations in component instantiation.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity port_map_aspect_syn3 is
  port (
    a_in  : in  bit_vector(3 downto 0);
    b_in  : in  bit_vector(3 downto 0);
    s_out : out bit_vector(4 downto 0)
  );
end entity port_map_aspect_syn3;

architecture rtl of port_map_aspect_syn3 is
  component adder4 is
    port (
      a    : in  bit_vector(3 downto 0);
      b    : in  bit_vector(3 downto 0);
      cin  : in  bit;
      sum  : out bit_vector(3 downto 0);
      cout : out bit
    );
  end component;
  signal s_carry : bit;
  signal s_sum   : bit_vector(3 downto 0);
begin
  -- Named + positional + open association all in one port_map_aspect
  u_add : adder4
    port map (
      a    => a_in,
      b    => b_in,
      cin  => '0',
      sum  => s_sum,
      cout => s_carry
    );
  s_out <= s_carry & s_sum;
end architecture rtl;
