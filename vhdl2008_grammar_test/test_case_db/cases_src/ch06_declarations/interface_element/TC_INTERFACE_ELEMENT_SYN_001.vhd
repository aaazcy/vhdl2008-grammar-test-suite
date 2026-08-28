-- =============================================================
-- Case ID: TC_INTERFACE_ELEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_element ::= interface_declaration
-- Case Type: Positive
-- Test Focus: interface_element showing mixed interface_declaration kinds
--   in an entity's generic and port interface lists:
--   interface_object_declaration (signal ports),
--   interface_type_declaration (generic type),
--   and interface_object_declaration (constant generics).
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iface_elem_mixed_kinds is
  generic (
    constant LATENCY : in natural := 2;
    type data_word is array(natural range <>) of bit;
  );
  port (
    signal clk   : in  bit;
    signal din   : in  data_word(7 downto 0);
    signal dout  : out data_word(7 downto 0);
    signal valid : out bit
  );
end entity iface_elem_mixed_kinds;

architecture rtl of iface_elem_mixed_kinds is
  type t_delay_line is array(0 to LATENCY - 1) of data_word(7 downto 0);
  signal delay_chain : t_delay_line := (others => (others => '0'));
  signal valid_sr    : bit_vector(0 to LATENCY - 1) := (others => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      delay_chain(0) <= din;
      for i in 1 to LATENCY - 1 loop
        delay_chain(i) <= delay_chain(i - 1);
      end loop;
      valid_sr(0) <= '1';
      for i in 1 to LATENCY - 1 loop
        valid_sr(i) <= valid_sr(i - 1);
      end loop;
    end if;
  end process;
  dout  <= delay_chain(LATENCY - 1);
  valid <= valid_sr(LATENCY - 1);
end architecture rtl;
