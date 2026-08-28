-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Positive
-- Test Focus: Record used in process with aggregate assignment using OTHERS choice on a multi-field record, exercising the interaction between record_type_definition and aggregate expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rec_agg_ent is port(r:out bit_vector(15 downto 0)); end entity;
architecture rec_agg_arch of rec_agg_ent is
  type t_reg_bank is record
    r0  : bit_vector(15 downto 0);
    r1  : bit_vector(15 downto 0);
    r2  : bit_vector(15 downto 0);
    r3  : bit_vector(15 downto 0);
  end record t_reg_bank;
  signal regs : t_reg_bank;
begin
  process
  begin
    regs <= (others => X"0000");
    wait for 1 ns;
    regs.r0 <= X"DEAD";
    regs.r1 <= X"BEEF";
    r <= regs.r0;
    wait;
  end process;
end architecture rec_agg_arch;
