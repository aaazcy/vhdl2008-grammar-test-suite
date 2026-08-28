-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DEFINITION_SNN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_definition ::=
--   protected_type_declaration | protected_type_body
-- Test Focus: ERROR — duplicate protected type declaration
--   for the same type name. The type definition allows
--   only one declaration per type name; a second declaration
--   is a syntax error.
-- Case Type: Negative
-- Expected Result: Triggers syntax error — duplicate declaration
-- =============================================================
entity pt_def_snn_dup_decl is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_def_snn_dup_decl;

architecture rtl of pt_def_snn_dup_decl is
  type t_dup is protected
    procedure set(x : integer);
  end protected;
  type t_dup is protected                     -- ERROR: duplicate declaration of t_dup
    procedure set(x : integer);
  end protected;
  type t_dup is protected body
    variable v : integer := 0;
    procedure set(x : integer) is begin v := x; end procedure;
  end protected body;
  shared variable sv : t_dup;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.set(1); val <= 1;
    end if;
  end process;
end architecture rtl;
