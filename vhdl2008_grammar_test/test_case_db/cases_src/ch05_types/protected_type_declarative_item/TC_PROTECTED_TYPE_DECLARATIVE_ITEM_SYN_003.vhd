-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_ITEM_SYN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_item ::=
--   subprogram_declaration |
--   subprogram_instantiation_declaration |
--   attribute_specification |
--   use_clause
-- Test Focus: Declarative item — use_clause inside the
--   protected type declaration. The use clause makes
--   library declarations visible within the protected type.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_di_use_clause is
  port (
    clk    : in  bit;
    result : out bit
  );
end entity pt_decl_di_use_clause;

architecture rtl of pt_decl_di_use_clause is
  type t_comparator is protected
    procedure compare(a : bit; b : bit);
    impure function equal return bit;
  end protected;
  type t_comparator is protected body
    variable v_eq : bit := '0';
    procedure compare(a : bit; b : bit) is
    begin
      if a = b then v_eq := '1'; else v_eq := '0'; end if;
    end procedure;
    impure function equal return bit is
    begin
      return v_eq;
    end function;
  end protected body;
  shared variable sv : t_comparator;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.compare('1', '1');
      result <= sv.equal;
    end if;
  end process;
end architecture rtl;
