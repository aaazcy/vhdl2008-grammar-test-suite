-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_ITEM_SYN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_item ::=
--   subprogram_declaration |
--   subprogram_instantiation_declaration |
--   attribute_specification |
--   use_clause
-- Test Focus: Declarative item — attribute_specification
--   applied to a subprogram declaration. Tests the
--   attribute_specification variant of the BNF alternation.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_di_attr_spec is
  port (
    clk : in  bit;
    tag : out integer
  );
end entity pt_decl_di_attr_spec;

architecture rtl of pt_decl_di_attr_spec is
  attribute syn_encoding : string;
  type t_tagged is protected
    procedure mark(id : integer);
    impure function id return integer;
    attribute syn_encoding of mark : procedure is "one_hot";
    attribute syn_encoding of id : function is "one_hot";
  end protected;
  type t_tagged is protected body
    variable v_id : integer := 0;
    procedure mark(id : integer) is begin v_id := id; end procedure;
    impure function id return integer is begin return v_id; end function;
  end protected body;
  shared variable sv : t_tagged;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.mark(13);
      tag <= sv.id;
    end if;
  end process;
end architecture rtl;
