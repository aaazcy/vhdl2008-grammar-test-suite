-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DEFINITION_SNN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_definition ::=
--   protected_type_declaration | protected_type_body
-- Test Focus: ERROR — protected body without a preceding
--   protected type declaration. The body alone is not a
--   complete type definition; the declaration must come
--   before any body referencing the same type name.
-- Case Type: Negative
-- Expected Result: Triggers syntax error — undeclared type
-- =============================================================
entity pt_def_snn_body_only is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_def_snn_body_only;

architecture rtl of pt_def_snn_body_only is
  type t_orphan is protected body               -- ERROR: no declaration for t_orphan
    variable v : integer := 0;
    procedure inc is begin v := v + 1; end procedure;
    impure function get return integer is begin return v; end function;
  end protected body;
  shared variable sv : t_orphan;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.inc; val <= sv.get;
    end if;
  end process;
end architecture rtl;
