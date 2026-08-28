-- =============================================================
-- Case ID: TC_ENTITY_TAG_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_TAG
-- Standard Reference: IEEE 1076-2008 Section 6.8
-- Production: entity_tag ::=
--   simple_name | character_literal | operator_symbol
-- Test Focus: entity_tag in group_template_declaration and
--   group_declaration contexts — uses simple_name form in
--   entity_class entries of group template, then instantiates
--   the group with concrete signals; also demonstrates
--   attribute specification referencing the group
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_bit.all;
entity entity_tag_syn_003 is
  port (
    addr      : in  bit_vector(3 downto 0);
    wr_data   : in  bit_vector(15 downto 0);
    wr_en     : in  bit;
    rd_data   : out bit_vector(15 downto 0);
    rd_en     : in  bit
  );
end entity entity_tag_syn_003;

architecture rtl of entity_tag_syn_003 is
  type t_mem_array is array(0 to 15) of bit_vector(15 downto 0);

  signal s_mem_core    : t_mem_array := (others => (others => '0'));
  signal s_addr_int    : integer range 0 to 15 := 0;
  signal s_rd_data_reg : bit_vector(15 downto 0) := (others => '0');

  -- User-defined attribute
  attribute memory_block : string;

  -- entity_tag used in entity_designator for attribute
  attribute memory_block of s_mem_core : signal is "RAMB16";

  -- Group template with entity_class entries
  -- The entity_class entries implicitly reference entity_tag values
  group mem_group is (signal, signal);

  -- Group declaration: concrete entity_tags bind to template
  group g_memory : mem_group (s_mem_core, s_rd_data_reg);

  -- Attribute on the group
  attribute memory_block of g_memory : group is "block_ram";

begin
  s_addr_int <= to_integer(unsigned(addr));

  -- Write process
  process(wr_en, s_addr_int, wr_data)
  begin
    if wr_en = '1' then
      s_mem_core(s_addr_int) <= wr_data;
    end if;
  end process;

  -- Read process
  process(rd_en, s_addr_int)
  begin
    if rd_en = '1' then
      s_rd_data_reg <= s_mem_core(s_addr_int);
    end if;
  end process;

  rd_data <= s_rd_data_reg;
end architecture rtl;
