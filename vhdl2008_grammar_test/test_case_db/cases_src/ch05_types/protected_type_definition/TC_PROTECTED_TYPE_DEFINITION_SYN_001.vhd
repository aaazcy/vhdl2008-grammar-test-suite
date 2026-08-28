-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DEFINITION_SYN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_definition ::=
--   protected_type_declaration | protected_type_body
-- Test Focus: Complete protected type definition with both
--   declaration and body. The declaration specifies a
--   single procedure; the body implements it. Tests the
--   minimal complete definition spanning both productions.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_def_minimal is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_def_minimal;

architecture rtl of pt_def_minimal is
  type t_box is protected
    procedure put(x : integer);
  end protected;
  type t_box is protected body
    variable v : integer := 0;
    procedure put(x : integer) is begin v := x; end procedure;
  end protected body;
  shared variable sv : t_box;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.put(255);
      val <= 255;
    end if;
  end process;
end architecture rtl;
