-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= ... | file_declaration | ... (22 alternatives)
-- Case Type: Positive
-- Test Focus: file_declaration as entity_declarative_item — the entity declarative part declares the file type t_logfile and the file object f_log, verifying file_declaration is legal in the entity declarative part and can define file handle types for interacting with external files
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edi_file_ent is
  port(clk:in bit; data_out:out integer);
  type t_logfile is file of string;
end entity edi_file_ent;
architecture bh of edi_file_ent is
  signal s_cnt:integer:=0;
begin
  process(clk) begin
    if clk'event and clk='1' then s_cnt<=s_cnt+1; end if;
  end process;
  data_out<=s_cnt;
end architecture bh;
