-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_ITEM_SYN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_item ::=
--   subprogram_declaration |
--   subprogram_instantiation_declaration |
--   attribute_specification |
--   use_clause
-- Test Focus: Declarative item — subprogram_declaration:
--   a procedure declaration with in/out parameters,
--   the most common declarative item in protected type
--   declarations.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_di_subp_decl is
  port (
    write_en : in  bit;
    addr     : out natural
  );
end entity pt_decl_di_subp_decl;

architecture rtl of pt_decl_di_subp_decl is
  type t_ptr is protected
    procedure move_to(a : natural);
    impure function current return natural;
  end protected;
  type t_ptr is protected body
    variable v_addr : natural := 0;
    procedure move_to(a : natural) is begin v_addr := a; end procedure;
    impure function current return natural is begin return v_addr; end function;
  end protected body;
  shared variable sv : t_ptr;
begin
  process(write_en)
  begin
    if write_en'event and write_en = '1' then
      sv.move_to(16#FF#);
      addr <= sv.current;
    end if;
  end process;
end architecture rtl;
