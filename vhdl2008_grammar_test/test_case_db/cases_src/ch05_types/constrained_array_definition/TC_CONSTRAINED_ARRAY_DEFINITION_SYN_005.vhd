-- =============================================================
-- Case ID: TC_CONSTRAINED_ARRAY_DEFINITION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: constrained_array_definition ::=
--   array index_constraint of element_subtype_indication
-- Case Type: Positive
-- Test Focus: Constrained array of records forming a programmable
--            interrupt vector table (IVT). Each element is a
--            record with an ISR address and priority.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interrupt_vector_table is
  port (
    clk      : in  bit;
    int_num  : in  integer range 0 to 15;
    isr_addr : in  integer range 0 to 65535;
    priority : in  integer range 0 to 7;
    vector   : out integer range 0 to 65535
  );
end entity interrupt_vector_table;

architecture rtl of interrupt_vector_table is
  type ivt_entry is record
    handler_addr : integer range 0 to 65535;
    priority_lvl : integer range 0 to 7;
    mask_enabled : boolean;
  end record;
  -- constrained_array_definition: array of records
  type ivt_array is array (0 to 15) of ivt_entry;
  signal ivt : ivt_array := (others =>
    (handler_addr => 0, priority_lvl => 0, mask_enabled => false));
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      ivt(int_num).handler_addr <= isr_addr;
      ivt(int_num).priority_lvl <= priority;
      ivt(int_num).mask_enabled <= true;
      vector <= ivt(int_num).handler_addr;
    end if;
  end process;
end architecture rtl;
