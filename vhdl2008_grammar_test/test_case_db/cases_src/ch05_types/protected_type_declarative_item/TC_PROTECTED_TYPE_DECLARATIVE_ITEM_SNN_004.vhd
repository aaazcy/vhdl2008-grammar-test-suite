-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_ITEM_SNN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_item ::=
--   subprogram_declaration |
--   subprogram_instantiation_declaration |
--   attribute_specification |
--   use_clause
-- Test Focus: ERROR — subprogram_body (implementation) inside
--   the protected declaration. Subprogram bodies belong in
--   the protected body, not the declaration. The declaration
--   only allows subprogram_declaration (specification), not
--   the full body.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_decl_di_snn_body_in_decl is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_di_snn_body_in_decl;

architecture rtl of pt_decl_di_snn_body_in_decl is
  type t_pt is protected
    procedure set(x : integer) is               -- ERROR: subprogram body not allowed in declaration
    begin
    end procedure;
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    procedure set(x : integer) is begin v := x; end procedure;
  end protected body;
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.set(1); val <= 1;
    end if;
  end process;
end architecture rtl;
