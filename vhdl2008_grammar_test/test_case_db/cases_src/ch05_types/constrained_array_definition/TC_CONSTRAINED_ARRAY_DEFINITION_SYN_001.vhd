-- =============================================================
-- Case ID: TC_CONSTRAINED_ARRAY_DEFINITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: constrained_array_definition ::=
--   array index_constraint of element_subtype_indication
-- Case Type: Positive
-- Test Focus: Basic constrained array with ascending range as a
--            small register file. index_constraint is (0 to 15),
--            element_subtype_indication is "integer range 0 to 65535".
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity simple_register_file is
  port (
    clk    : in  bit;
    wr_en  : in  bit;
    addr   : in  integer range 0 to 15;
    wdata  : in  integer range 0 to 65535;
    rdata  : out integer range 0 to 65535
  );
end entity simple_register_file;

architecture rtl of simple_register_file is
  -- constrained_array_definition: index_constraint (0 to 15)
  -- element_subtype_indication: integer range 0 to 65535
  type regfile is array (0 to 15) of integer range 0 to 65535;
  signal regs : regfile := (others => 0);
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if wr_en = '1' then
        regs(addr) <= wdata;
      end if;
      rdata <= regs(addr);
    end if;
  end process;
end architecture rtl;
