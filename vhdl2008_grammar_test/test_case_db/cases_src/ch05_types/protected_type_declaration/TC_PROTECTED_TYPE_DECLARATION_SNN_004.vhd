-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declaration ::=
--   protected
--     protected_type_declarative_part
--   end protected [ protected_type_simple_name ]
-- Test Focus: ERROR — constant_declaration inside the protected
--   type declaration. Constants are not in the declaration's
--   declarative item set. Only subprogram_declaration,
--   subprogram_instantiation_declaration, attribute_specification,
--   and use_clause are permitted.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_decl_snn_const_in_decl is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_snn_const_in_decl;

architecture rtl of pt_decl_snn_const_in_decl is
  type t_pt is protected
    constant C_ERR : integer := 5;             -- ERROR: constant not allowed in declaration
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
