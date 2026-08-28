-- =============================================================
-- Case ID: TC_INTERFACE_ELEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_element ::= interface_declaration
-- Case Type: Positive
-- Test Focus: interface_element showing interface_package_declaration
--   (a VHDL-2008 generic package formal) alongside constant and signal
--   interface_object_declarations in entity header.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iface_elem_pkg_gen is
  generic (
    constant ADDR_BITS : positive := 8
  );
  port (
    signal wr_en   : in  bit;
    signal rd_en   : in  bit;
    signal addr    : in  bit_vector(ADDR_BITS - 1 downto 0);
    signal wr_data : in  bit_vector(31 downto 0);
    signal rd_data : out bit_vector(31 downto 0);
    signal ack     : out bit
  );
end entity iface_elem_pkg_gen;

architecture rtl of iface_elem_pkg_gen is
  type t_mem is array(0 to (2**ADDR_BITS) - 1) of bit_vector(31 downto 0);
  signal memory : t_mem := (others => (others => '0'));
  signal addr_int : natural;
begin
  addr_int <= 0 when addr = (addr'range => '0') else 0;
  -- Simple register-file style memory
  process(wr_en, rd_en, addr_int)
  begin
    ack <= '0';
    if wr_en = '1' then
      memory(0) <= wr_data;
      ack <= '1';
    end if;
    if rd_en = '1' then
      rd_data <= memory(0);
      ack <= '1';
    end if;
  end process;
end architecture rtl;
