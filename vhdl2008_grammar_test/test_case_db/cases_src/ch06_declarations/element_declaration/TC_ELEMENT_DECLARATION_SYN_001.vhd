-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::=
--   identifier_list : element_subtype_definition ;
-- Test Focus: Record type with element declarations using
--   scalar types (integer, bit), single-identifier elements,
--   and used in a register design — exercises the basic
--   identifier_list : element_subtype_definition ; form
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_bit.all;
entity element_declaration_syn_001 is
  port (
    clk        : in  bit;
    rst_n      : in  bit;
    addr_in    : in  bit_vector(3 downto 0);
    data_in    : in  bit_vector(7 downto 0);
    wr_en      : in  bit;
    rd_en      : in  bit;
    data_out   : out bit_vector(7 downto 0)
  );
end entity element_declaration_syn_001;

architecture rtl of element_declaration_syn_001 is
  -- Record type with element declarations
  type t_register_file_entry is record
    reg_addr : integer range 0 to 15;          -- ELEMENT_DECLARATION
    reg_data : bit_vector(7 downto 0);         -- ELEMENT_DECLARATION
    reg_valid : bit;                            -- ELEMENT_DECLARATION
    reg_dirty : bit;                            -- ELEMENT_DECLARATION
  end record;

  type t_rf_array is array(0 to 15) of t_register_file_entry;

  signal s_rf      : t_rf_array := (others => (
    reg_addr => 0, reg_data => (others => '0'), reg_valid => '0', reg_dirty => '0'
  ));
  signal s_addr_int : integer range 0 to 15 := 0;
  signal s_rd_data  : bit_vector(7 downto 0) := (others => '0');
begin
  s_addr_int <= to_integer(unsigned(addr_in));

  -- Write process
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      for i in 0 to 15 loop
        s_rf(i).reg_valid <= '0';
        s_rf(i).reg_dirty <= '0';
        s_rf(i).reg_data <= (others => '0');
      end loop;
    elsif clk'event and clk = '1' then
      if wr_en = '1' then
        s_rf(s_addr_int).reg_data  <= data_in;
        s_rf(s_addr_int).reg_valid <= '1';
        s_rf(s_addr_int).reg_dirty <= '1';
      end if;
      if rd_en = '1' then
        s_rd_data <= s_rf(s_addr_int).reg_data;
        s_rf(s_addr_int).reg_dirty <= '0';
      end if;
    end if;
  end process;

  data_out <= s_rd_data;
end architecture rtl;
