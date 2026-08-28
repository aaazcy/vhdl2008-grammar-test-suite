-- =============================================================
-- Case ID: TC_ASSOCIATION_ELEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSOCIATION_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_element ::= [ formal_part => ] actual_part
-- Case Type: Positive (Production-Specific)
-- Test Focus: association_element — exercises the named association form
--             (with formal_part =>) in a component instantiation port map.
--             Each element uses explicit port-name-to-signal mapping.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity association_element_syn1 is
  port (
    clk       : in  bit;
    addr      : in  bit_vector(3 downto 0);
    write_en  : in  bit;
    data_in   : in  bit_vector(7 downto 0);
    data_out  : out bit_vector(7 downto 0)
  );
end entity association_element_syn1;

architecture arch of association_element_syn1 is

  component ram_cell is
    port (
      clock    : in  bit;
      address  : in  bit_vector(3 downto 0);
      we       : in  bit;
      din      : in  bit_vector(7 downto 0);
      dout     : out bit_vector(7 downto 0)
    );
  end component;

  signal s_addr_reg  : bit_vector(3 downto 0);
  signal s_din_reg   : bit_vector(7 downto 0);
  signal s_dout      : bit_vector(7 downto 0);

begin

  s_addr_reg <= addr;
  s_din_reg  <= data_in;

  -- association_element = formal_part => actual_part
  -- Each element uses the named form: port_name => signal_name
  u_ram : component ram_cell
    port map (
      clock   => clk,
      address => s_addr_reg,
      we      => write_en,
      din     => s_din_reg,
      dout    => s_dout
    );

  data_out <= s_dout;

end architecture arch;
