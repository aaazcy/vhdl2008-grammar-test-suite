-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DEFINITION_SNN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_definition ::=
--   protected_type_declaration | protected_type_body
-- Test Focus: ERROR — duplicate protected body for the same
--   type name. The type definition allows only one body
--   per type; a second body is a syntax error.
-- Case Type: Negative
-- Expected Result: Triggers syntax error — duplicate body
-- =============================================================
entity pt_def_snn_dup_body is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_def_snn_dup_body;

architecture rtl of pt_def_snn_dup_body is
  type t_dup2 is protected
    procedure set(x : integer);
  end protected;
  type t_dup2 is protected body
    variable v : integer := 0;
    procedure set(x : integer) is begin v := x; end procedure;
  end protected body;
  type t_dup2 is protected body                  -- ERROR: duplicate body for t_dup2
    variable v2 : integer := 0;
    procedure set(x : integer) is begin v2 := x; end procedure;
  end protected body;
  shared variable sv : t_dup2;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.set(1); val <= 1;
    end if;
  end process;
end architecture rtl;
