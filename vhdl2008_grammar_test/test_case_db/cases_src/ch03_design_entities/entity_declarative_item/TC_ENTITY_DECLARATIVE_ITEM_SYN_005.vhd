-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= ... | signal_declaration | ... (22 alternatives)
-- Case Type: Positive
-- Test Focus: signal_declaration as entity_declarative_item — the entity declarative part declares the internal signal s_state (integer range 0 to 7), verifying signal_declaration is a legal item of the entity declarative part, internal signals are visible in the entity statement part and the architecture
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edi_signal_ent is
  port(clk,next_st:in bit; st_out:out integer);
  signal s_state:integer range 0 to 7:=0;
end entity edi_signal_ent;
architecture bh of edi_signal_ent is
begin
  process(clk) begin
    if clk'event and clk='1' then
      if next_st='1' then
        if s_state<7 then s_state<=s_state+1; else s_state<=0; end if;
      end if;
    end if;
  end process;
  st_out<=s_state;
end architecture bh;
