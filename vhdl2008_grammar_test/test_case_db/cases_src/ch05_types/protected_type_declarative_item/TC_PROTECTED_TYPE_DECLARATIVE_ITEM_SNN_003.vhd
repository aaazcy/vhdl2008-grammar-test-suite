-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_ITEM_SNN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_item ::=
--   subprogram_declaration |
--   subprogram_instantiation_declaration |
--   attribute_specification |
--   use_clause
-- Test Focus: ERROR — constant_declaration inside protected
--   type declaration. Constants are body-side declarative
--   items, not valid in the declaration side.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_decl_di_snn_constant is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_di_snn_constant;

architecture rtl of pt_decl_di_snn_constant is
  type t_pt is protected
    constant C_ERR : natural := 16;            -- ERROR: constant not allowed in declaration
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
