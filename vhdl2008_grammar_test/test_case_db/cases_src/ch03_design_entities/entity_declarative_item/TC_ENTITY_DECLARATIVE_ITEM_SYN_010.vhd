-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= ... | shared_variable_declaration | ... (22 alternatives)
-- Case Type: Positive
-- Test Focus: shared_variable_declaration as entity_declarative_item — the entity declarative part declares shared variable sv_counter:integer:=0, verifying shared_variable_declaration is legal in the entity declarative part, multiple processes can safely share the variable
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edi_sharedvar_ent is
  port(clk,inc:in bit; val_out:out integer);
  type t_pt is protected
    procedure incr;
    impure function get return integer;
  end protected t_pt;
  type t_pt is protected body
    variable v_cnt:integer:=0;
    procedure incr is
    begin
      v_cnt:=v_cnt+1;
    end procedure;
    impure function get return integer is
    begin
      return v_cnt;
    end function;
  end protected body t_pt;
  shared variable sv_counter:t_pt;
end entity edi_sharedvar_ent;
architecture bh of edi_sharedvar_ent is
begin
  process(clk) begin
    if clk'event and clk='1' then
      if inc='1' then sv_counter.incr; end if;
    end if;
  end process;
  val_out<=sv_counter.get;
end architecture bh;
