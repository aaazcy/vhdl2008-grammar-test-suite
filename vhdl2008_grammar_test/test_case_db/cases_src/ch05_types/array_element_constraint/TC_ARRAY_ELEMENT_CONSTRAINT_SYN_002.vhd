-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_CONSTRAINT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_constraint ::= element_constraint
-- Case Type: Positive
-- Test Focus: array_element_constraint wrapping a record_constraint.
--            Records stored in a register file array with constrained
--            fields demonstrate element-level constraint application.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity register_file_bank is
  port (
    clk        : in  bit;
    wr_en      : in  bit;
    rd_addr    : in  integer range 0 to 15;
    wr_data    : in  integer range 0 to 65535;
    rd_data    : out integer range 0 to 65535
  );
end entity register_file_bank;

architecture rtl of register_file_bank is
  type reg_entry is record
    value   : integer range 0 to 65535;
    valid   : boolean;
  end record;
  -- array_element_constraint applied: each element is a constrained record
  subtype constrained_entry is reg_entry;
  type reg_file is array (0 to 15) of constrained_entry;
  signal registers : reg_file := (others => (value => 0, valid => false));
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if wr_en = '1' then
        registers(rd_addr).value <= wr_data;
        registers(rd_addr).valid <= true;
      end if;
      rd_data <= registers(rd_addr).value;
    end if;
  end process;
end architecture rtl;
