-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_SMN_001
-- Related Rule ID: SMN_PROTECTE_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body ::=
--   protected body
--     protected_type_body_declarative_part
--   end protected body [ protected_type_simple_name ]
-- Test Focus: SEMANTIC NEGATIVE — protected body missing a
--   method body for a declared subprogram. The declaration
--   specifies `procedure reset` but the body never implements it.
-- Case Type: Negative
-- Expected Result: Triggers semantic error — missing method body
-- =============================================================
entity pt_body_smn_missing_method is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_body_smn_missing_method;

architecture rtl of pt_body_smn_missing_method is
  type t_incomplete is protected
    procedure reset;
    procedure inc;
    impure function get return integer;
  end protected;
  type t_incomplete is protected body
    variable v : integer := 0;
    -- ERROR: procedure reset body missing
    procedure inc is
    begin
      v := v + 1;
    end procedure;
    impure function get return integer is
    begin
      return v;
    end function;
  end protected body;
  shared variable sv : t_incomplete;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.inc;
      val <= sv.get;
    end if;
  end process;
end architecture rtl;
