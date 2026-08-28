-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_CONSTRAINT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_constraint ::= element_constraint
-- Case Type: Positive
-- Test Focus: Multi-dimensional array with element_constraint using
--            both array_constraint and record_constraint. A DDR
--            burst descriptor table with constrained fields.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ddr_burst_descriptor is
  port (
    clk        : in  bit;
    bank_sel   : in  integer range 0 to 3;
    row_sel    : in  integer range 0 to 7;
    burst_len  : out integer range 1 to 8;
    base_addr  : out integer range 0 to 4095
  );
end entity ddr_burst_descriptor;

architecture rtl of ddr_burst_descriptor is
  type burst_entry is record
    length_val  : integer range 1 to 8;
    addr_base   : integer range 0 to 4095;
    active_flag : boolean;
  end record;
  -- array_element_constraint via record_constraint
  subtype constrained_burst is burst_entry;
  type burst_table_row is array (0 to 7) of constrained_burst;
  type burst_table is array (0 to 3) of burst_table_row;
  signal table : burst_table := (others => (others =>
    (length_val => 1, addr_base => 0, active_flag => false)));
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      burst_len <= table(bank_sel)(row_sel).length_val;
      base_addr <= table(bank_sel)(row_sel).addr_base;
    end if;
  end process;
end architecture rtl;
