-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_ITEM_SNN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_item ::=
--   subprogram_declaration |
--   subprogram_instantiation_declaration |
--   attribute_specification |
--   use_clause
-- Test Focus: ERROR — type_declaration inside protected type
--   declaration. Type declarations are not valid in the
--   declaration — they are body-side items only.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_decl_di_snn_type is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_di_snn_type;

architecture rtl of pt_decl_di_snn_type is
  type t_pt is protected
    type t_err is range 0 to 7;                -- ERROR: type declaration not allowed in declaration
    procedure set(x : integer);
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
