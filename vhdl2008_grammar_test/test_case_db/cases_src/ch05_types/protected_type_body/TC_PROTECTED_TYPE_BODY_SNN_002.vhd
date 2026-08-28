-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_SNN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body ::=
--   protected body
--     protected_type_body_declarative_part
--   end protected body [ protected_type_simple_name ]
-- Test Focus: ERROR — missing the closing 'body' keyword.
--   The production requires 'end protected body', not just
--   'end protected'. This tests that the parser requires
--   the full closing phrase.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_body_snn_missing_close_body is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_body_snn_missing_close_body;

architecture rtl of pt_body_snn_missing_close_body is
  type t_pt is protected
    procedure set(v : integer);
    impure function get return integer;
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    procedure set(vi : integer) is begin v := vi; end procedure;
    impure function get return integer is begin return v; end function;
  end protected;                              -- ERROR: should be 'end protected body'
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.set(42); val <= sv.get;
    end if;
  end process;
end architecture rtl;
