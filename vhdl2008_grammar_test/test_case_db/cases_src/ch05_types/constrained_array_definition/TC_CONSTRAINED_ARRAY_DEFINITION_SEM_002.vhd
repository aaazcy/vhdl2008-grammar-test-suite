-- =============================================================
-- Case ID: TC_CONSTRAINED_ARRAY_DEFINITION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONSTRAINED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: constrained_array_definition ::=
--   array index_constraint of element_subtype_indication
-- Case Type: Positive
-- Test Focus: Semantic: constrained array for an ALU register
--            bank with read port A, read port B, and write port.
--            Two simultaneous reads from a constrained register
--            array.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity alu_register_bank is
  port (
    clk    : in  bit;
    we     : in  bit;
    ra     : in  integer range 0 to 31;
    rb     : in  integer range 0 to 31;
    rw     : in  integer range 0 to 31;
    wdata  : in  integer range -32768 to 32767;
    adata  : out integer range -32768 to 32767;
    bdata  : out integer range -32768 to 32767
  );
end entity alu_register_bank;

architecture rtl of alu_register_bank is
  type reg_bank is array (0 to 31) of integer range -32768 to 32767;
  signal regs : reg_bank := (others => 0);
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if we = '1' then
        regs(rw) <= wdata;
      end if;
      adata <= regs(ra);
      bdata <= regs(rb);
    end if;
  end process;
end architecture rtl;
