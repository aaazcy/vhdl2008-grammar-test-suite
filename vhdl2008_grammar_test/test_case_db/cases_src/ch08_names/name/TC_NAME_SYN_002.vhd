-- =============================================================
-- Case ID: TC_NAME_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.1
-- Production: name ::= simple_name | operator_symbol | character_literal | selected_name | indexed_name | slice_name | attribute_name | external_name
-- Case Type: Positive
-- Test Focus: name forms: simple_name + selected_name + indexed_name together — exercises simple_name (signal names), selected_name (record.field), and indexed_name (array(index)) all appearing as names in signal assignments
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity name_forms_ent is
  port(addr : in integer range 0 to 15; data_w : in bit_vector(7 downto 0); data_r : out bit_vector(7 downto 0); we : in bit);
end entity;

architecture bh of name_forms_ent is
  type mem_cell_t is record
    content : bit_vector(7 downto 0);
    valid   : bit;
  end record;
  type mem_array_t is array(0 to 15) of mem_cell_t;
  signal mem : mem_array_t := (others => (content=>X"00", valid=>'0'));
  signal addr_reg : integer range 0 to 15 := 0;
begin
  process(we, addr, data_w)
  begin
    addr_reg <= addr;
    if we = '1' then
      mem(addr).content <= data_w;  -- indexed_name+selected_name
      mem(addr).valid <= '1';
    end if;
    data_r <= mem(addr_reg).content;  -- simple_name + indexed_name + selected_name
  end process;
end architecture bh;
